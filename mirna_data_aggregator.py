import csv
import glob   

path = '/DATA/tcga/Data/miRNASeq/BCGSC__IlluminaHiSeq_miRNASeq/Level_3/quantification/*.txt'  #dir where txt files are present
i=0;
print path
list=[]
s='read_count';
files=glob.glob(path)

f=open("read_count_1.txt",'w')
for file in files:
     q=file[123:125]
     print q
   #if int(q)==11:
     m=file[110:138];     
     f.write(m)
     f.write("\t")
     with open(file) as inf:
       for line in inf:
         parts = line.split('\t') # split line into parts
         if len(parts) > 1:   # if at least 2 parts/columns
             if str(parts[1]) !=  s: #for not to write first line
                f.write(parts[1]) #column containing read_count [2] for read_per_million_count(rpm)
                f.write("\t")
     i=i+1;
     f.write("\n")    

f.close()
print i

with open("read_count_1.txt", "rb") as infile1: ##Creating a list of lines 
     for line in infile1:
         parts = line.split('\t') # split line into parts
         list.append(parts)

m=open("read_count_2.txt", 'wb')  #converitng  rows to columns
for x in zip(*list):
  for y in x:
    m.write(y+'\t')
  m.write('\n')

m.close() 

with open("read_count_2.txt", "rb") as infile, open("read_count.csv", 'wb') as outfile:  ##Converting txt to CSV
        in_txt = csv.reader(infile, delimiter = '\t')
        out_csv = csv.writer(outfile)
        out_csv.writerows(in_txt)



