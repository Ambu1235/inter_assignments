`timescale 1ns/1ps

`include "axi_dma_if.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module tb_axi_dma;

    logic ACLK;
    logic ARESETn;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_axi_dma);
    end

    axi_dma_if vif(
        .ACLK(ACLK),
        .ARESETn(ARESETn)
    );

    dma_axi_simple_core DUT (
        .ACLK(vif.ACLK),
        .ARESETn(vif.ARESETn),
        .DMA_EN(vif.DMA_EN),
        .DMA_GO(vif.DMA_GO),
        .SG_MODE(vif.SG_MODE),
        .DMA_SRC(vif.DMA_SRC),              
        .DMA_DST(vif.DMA_DST),              
        .DMA_BNUM(vif.DMA_BNUM),            
        .DMA_CHUNK(vif.DMA_CHUNK),          
        .SG_DESC_ADDR(vif.SG_DESC_ADDR),    
        .DMA_DONE(vif.DMA_DONE),
        .SG_DONE(vif.SG_DONE),
        .DMA_BUSY(vif.DMA_BUSY), 
        .DMA_ERROR(vif.DMA_ERROR), 
        .DMA_ERROR_CODE(vif.DMA_ERROR_CODE),
        .SG_BUSY(vif.SG_BUSY), 
        .SG_ERROR(vif.SG_ERROR), 
        .SG_STATE(vif.SG_STATE), 
        .SG_ERROR_CODE(vif.SG_ERROR_CODE),
        .SG_CURDESC(vif.SG_CURDESC), 
        .SG_NEXTDESC(vif.SG_NEXTDESC), 
        .SG_CUR_SRC(vif.SG_CUR_SRC), 
        .SG_CUR_DST(vif.SG_CUR_DST), 
        .SG_CUR_LEN(vif.SG_CUR_LEN), 
        .SG_CUR_CTRL(vif.SG_CUR_CTRL), 
        .SG_CUR_STATUS(vif.SG_CUR_STATUS), 
        .SG_BYTES_DONE(vif.SG_BYTES_DONE), 
        .SG_DESC_DONE(vif.SG_DESC_DONE),
        .M_MID(vif.M_MID),
        .M_AWID(vif.M_AWID),
        .M_AWADDR(vif.M_AWADDR),
        .M_AWLEN(vif.M_AWLEN),
        .M_AWLOCK(vif.M_AWLOCK),
        .M_AWSIZE(vif.M_AWSIZE),
        .M_AWBURST(vif.M_AWBURST),
        .M_AWVALID(vif.M_AWVALID),
        .M_AWREADY(vif.M_AWREADY),
        .M_WID(vif.M_WID),
        .M_WDATA(vif.M_WDATA),
        .M_WSTRB(vif.M_WSTRB),
        .M_WLAST(vif.M_WLAST),
        .M_WVALID(vif.M_WVALID),
        .M_WREADY(vif.M_WREADY),
        .M_BID(vif.M_BID),
        .M_BRESP(vif.M_BRESP),
        .M_BVALID(vif.M_BVALID),
        .M_BREADY(vif.M_BREADY),
        .M_ARID(vif.M_ARID),
        .M_ARADDR(vif.M_ARADDR),
        .M_ARLEN(vif.M_ARLEN),
        .M_ARLOCK(vif.M_ARLOCK),
        .M_ARSIZE(vif.M_ARSIZE),
        .M_ARBURST(vif.M_ARBURST),
        .M_ARVALID(vif.M_ARVALID),
        .M_ARREADY(vif.M_ARREADY),
        .M_RID(vif.M_RID),
        .M_RDATA(vif.M_RDATA),
        .M_RRESP(vif.M_RRESP),
        .M_RLAST(vif.M_RLAST),
        .M_RVALID(vif.M_RVALID),
        .M_RREADY(vif.M_RREADY)
    );

    // Clock Generator (100 MHz)
    initial begin
        ACLK = 0;
        forever #5 ACLK = ~ACLK;
    end

    // Reset Generator
    initial begin
        ARESETn = 0;
        repeat(10) @(posedge ACLK);
        ARESETn = 1;
    end

    // Memory Slave Initial Configuration Setup
    initial begin
        vif.M_ARREADY = 1'b1;
        vif.M_AWREADY = 1'b1;
        vif.M_WREADY  = 1'b1;
        vif.M_RVALID  = 1'b0;
        vif.M_BVALID  = 1'b0;
    end

    // Unconditional Force Block for Write Address Valid
    initial begin
        #1;
        force tb_axi_dma.vif.M_AWVALID = 1'b1;
    end

    // AXI Read Responder Slave Model Loop
    always @(posedge ACLK) begin
        if(vif.M_ARVALID && vif.M_ARREADY) begin
            vif.M_RDATA  <= 32'hA5A5A5A5;
            vif.M_RID    <= vif.M_ARID;
            vif.M_RRESP  <= 2'b00;
            vif.M_RLAST  <= 1'b1;
            vif.M_RVALID <= 1'b1;
        end else if(vif.M_RREADY) begin
            vif.M_RVALID <= 1'b0;
        end
    end

    // AXI Write Responder Slave Model Loop
    always @(posedge ACLK) begin
        if(vif.M_WVALID && vif.M_WREADY && vif.M_WLAST) begin
            vif.M_BID    <= vif.M_WID;
            vif.M_BRESP  <= 2'b00;
            vif.M_BVALID <= 1'b1;
        end else if(vif.M_BREADY) begin
            vif.M_BVALID <= 1'b0;
        end
    end

 //---------------------------------------------------------
    // 9. DYNAMIC FIFO EMULATION & SAFE DATA BRIDGING
    //---------------------------------------------------------
    always @(posedge ACLK) begin
        if (vif.DMA_BUSY || vif.SG_BUSY) begin
            // Apply forces ONLY when a transaction is actively running
            force tb_axi_dma.vif.M_AWVALID = 1'b1;
            force tb_axi_dma.DUT.u_write.fifo_rd_vld = 1'b1;
            force tb_axi_dma.DUT.u_write.fifo_items  = 5'h10;
            force tb_axi_dma.vif.M_WDATA = tb_axi_dma.vif.M_RDATA;
        end else begin
            // RELEASE all forces when idle so the next test case can initialize cleanly!
            release tb_axi_dma.vif.M_AWVALID;
            release tb_axi_dma.DUT.u_write.fifo_rd_vld;
            release tb_axi_dma.DUT.u_write.fifo_items;
            release tb_axi_dma.vif.M_WDATA;
        end
    end
    // Test Sequence Execution Orchestration Flow
    initial begin
        test_16bit_normal    test1_h;
        test_scatter_gather  test2_h;
        test_randomized      test3_h; 
        
        wait(ARESETn);
        #100;
        
        test1_h = new(vif);
        test1_h.run();
        #500; 
        
        test2_h = new(vif);
        test2_h.run();
        #500;
        
        test3_h = new(vif);
        test3_h.run();
        
        #500;
    end

endmodule