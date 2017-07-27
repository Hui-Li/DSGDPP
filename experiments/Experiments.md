### Generate Initial Factors
```
# MovieLens10M
./mfcreateInitialFactors --size1 69878 --size2 10677 --values "Uniform(-0.5,0.5)" --rank 50 --outDir /home/hli/Desktop/mf_data/mf_data/ml10m/factors/50/

./mfcreateInitialFactors --size1 69878 --size2 10677 --values "Uniform(-0.5,0.5)" --rank 100 --outDir /home/hli/Desktop/mf_data/mf_data/ml10m/factors/100/

# MovieLens20M
./mfcreateInitialFactors --size1 138493 --size2 26744 --values "Uniform(-0.5,0.5)" --rank 50 --outDir /home/hli/Desktop/mf_data/mf_data/ml20m/factors/50/

./mfcreateInitialFactors --size1 138493 --size2 26744 --values "Uniform(-0.5,0.5)" --rank 100 --outDir /home/hli/Desktop/mf_data/mf_data/ml20m/factors/100/

# Netflix
./mfcreateInitialFactors --size1 480189 --size2 17770 --values "Uniform(-0.5,0.5)" --rank 50 --outDir /home/hli/Desktop/mf_data/mf_data/netflix/factors/50/

./mfcreateInitialFactors --size1 480189 --size2 17770 --values "Uniform(-0.5,0.5)" --rank 100 --outDir /home/hli/Desktop/mf_data/mf_data/netflix/factors/100/

# Yahoo! Music
./mfcreateInitialFactors --size1 1000990 --size2 624961 --values "Uniform(-0.5,0.5)" --rank 50 --outDir /home/hli/Desktop/mf_data/mf_data/yahoo/factors/50/

./mfcreateInitialFactors --size1 1000990 --size2 624961 --values "Uniform(-0.5,0.5)" --rank 100 --outDir /home/hli/Desktop/mf_data/mf_data/yahoo/factors/100/

```

### Run
```
./mfdsgdpp --tasks-per-rank=4 --input-file /home/hli/Desktop/mf_data/data/ml10m/train.mmc --input-test-file /home/hli/Desktop/mf_data/data/ml10m/test.mmc --input-row-file /home/hli/Desktop/mf_data/data/ml10m/factors/50/W.mma --input-col-file /home/hli/Desktop/mf_data/data/ml10m/factors/50/H.mma --trace dsgdpp_ml10m --rank 50 --update="Nzsl_Nzl2(1)" --regularize="None" --loss="Nzsl_Nzl2(1)" --truncate="(-100,100)" --decay="BoldDriver(0.01)" --epochs=10

./mfdsgdpp --tasks-per-rank=4 --input-file /home/hli/Desktop/mf_data/data/netflix/train.mmc --input-test-file /home/hli/Desktop/mf_data/data/netflix/test.mmc --input-row-file /home/hli/Desktop/mf_data/data/netflix/factors/50/W.mma --input-col-file /home/hli/Desktop/mf_data/data/netflix/factors/50/H.mma --trace dsgdpp_netflix.R --rank 50 --update="Nzsl_Nzl2(0.05)" --regularize="None" --loss="Nzsl_Nzl2(0.05)" --truncate="(-100,100)" --decay="BoldDriver(0.0125)" --epochs=10

./mfdsgdpp --tasks-per-rank=4 --input-file /home/hli/Desktop/mf_data/data/netflix/train.mmc --input-test-file /home/hli/Desktop/mf_data/data/netflix/test.mmc --input-row-file /home/hli/Desktop/mf_data/data/netflix/factors/100/W.mma --input-col-file /home/hli/Desktop/mf_data/data/netflix/factors/100/H.mma --trace dsgdpp_netflix.R --rank 100 --update="Nzsl_Nzl2(0.05)" --regularize="None" --loss="Nzsl_Nzl2(0.05)" --truncate="(-100,100)" --decay="BoldDriver(0.025)" --epochs=10

./mfdsgdpp --tasks-per-rank=4 --input-file /home/hli/Desktop/mf_data/data/yahoo/train.mmc --input-test-file /home/hli/Desktop/mf_data/data/yahoo/test.mmc --input-row-file /home/hli/Desktop/mf_data/data/yahoo/factors/50/W.mma --input-col-file /home/hli/Desktop/mf_data/data/yahoo/factors/50/H.mma --trace dsgdpp_yahoo.R --rank 50 --update="Nzsl_Nzl2(1)" --regularize="None" --loss="Nzsl_Nzl2(1)" --truncate="(-100,100)" --decay="BoldDriver(0.00125)" --epochs=10
```