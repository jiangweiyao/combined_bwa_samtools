FROM continuumio/miniconda3:latest

# Install the conda environment
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/combined_bwa_samtools/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name combined_bwa_samtools > combined_bwa_samtools.yml
