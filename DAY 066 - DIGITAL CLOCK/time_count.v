module time_count(clk,rst,ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec);
	input clk,rst;
	output reg[3:0]ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec;
	
	always@(posedge clk)
		begin
			if(rst)
				{ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec} <= 0;
			else
				begin
					ls_sec <= ls_sec + 1;
					if(ls_sec == 4'd9)
						begin
							ls_sec <= 4'd0;
							ms_sec <= ms_sec + 1;
							if(ms_sec == 4'd5)
								begin
									if(ls_sec == 4'd9)
										begin
											ls_sec <= 4'd0;
											ms_sec <= 4'd0;
											ls_min <= ls_min +1;
											if(ls_min == 4'd9)
												begin
													ls_min <= 4'd0;
													ms_min <= ms_min + 1;
													if(ms_min == 4'd5)
														begin
															if(ls_min == 4'd9)
																begin
																	ls_min <= 4'd0;
																	ms_min <= 4'd0;
																	ls_sec <= 4'd0;
																	ms_sec <= 4'd0;
																	ls_hr <= ls_hr + 1;
																	if(ls_hr == 4'd9)
																		begin
																			ls_hr <= 4'd0;
																			ms_hr <= ms_hr + 1;
																		end
																	if(ms_hr == 4'd2)
																		begin
																			if(ls_hr >= 4'd3)
																				begin
																					{ms_hr,ls_hr,ms_min,ls_min,ms_sec,ls_sec} <= 0;
																				end
																		end
																end
														end
												end
										end
								end
						end
				end
		end
endmodule