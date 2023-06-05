in_file = open("sail-core/verilog/program.hex", "r")
lines = in_file.readlines()
in_file.close()

out_file_1 = open("sail-core/verilog/program1.hex", "w")
out_file_2 = open("sail-core/verilog/program2.hex", "w")
out_file_3 = open("sail-core/verilog/program3.hex", "w")
out_file_4 = open("sail-core/verilog/program4.hex", "w")

lines_1 = [line[6:8] + "\n" for line in lines]
lines_2 = [line[4:6] + "\n" for line in lines]
lines_3 = [line[2:4] + "\n" for line in lines]
lines_4 = [line[0:2] + "\n" for line in lines]


out_file_1.writelines(lines_1[:512])
out_file_2.writelines(lines_2[:512])
out_file_3.writelines(lines_3[:512])
out_file_4.writelines(lines_4[:512])


out_file_1.close()
out_file_2.close()
out_file_3.close()
out_file_4.close()