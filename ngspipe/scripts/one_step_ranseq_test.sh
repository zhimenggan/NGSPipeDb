# 1. download ngspipedb to anywhere you want
# git clone git://github.com/xuanblo/NGSPipeDb.git && mv NGSPipeDb mouse_transcriptome_analysis && cd mouse_transcriptome_analysis

# 2. install conda for your platform
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/Miniconda3-latest-Linux-x86_64.sh && bash /tmp/Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda3

# 3. create conda environment
mamba create -c conda-forge -c bioconda --name ngspipe-rnaseq snakemake=5.30.2 python=3.8 seqkit=0.14.0

# 4. update ensential packages
mamba env update -n ngspipe-rnaseq --file ngspipe/envs/requirements_rnaseq.yaml --prune

# 5. enter conda env
conda activate ngspipe-rnaseq

# 6. download testfile
bash ngspipe/scripts/download_testdata.sh testdata

# 7. run snakemake
snakemake -s ngspipe/rnaseq_analysis.Snakefile.py --configfile ngspipe/config/rnaseq.config.yaml --dag|dot -Tpng > dag.png
snakemake -s ngspipe/rnaseq_analysis.Snakefile.py --configfile ngspipe/config/rnaseq.config.yaml -p -j 10

# 8. generate report
snakemake --snakefile ngspipe/rnaseq_analysis.Snakefile.py --configfile ngspipe/config/rnaseq.config.yaml --report results/report/report.html

# 9. exit env
conda deactivate