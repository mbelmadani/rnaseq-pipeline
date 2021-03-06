# List of scripts 

## Pipeline scripts
The following scripts are called automatically by the [scheduler tasks](https://github.com/PavlidisLab/rnaseq-pipeline/blob/master/scheduler/README.md).
* arrayexpress_to_fastq.sh - Download ArrayExpress FASTQ files instead of using GEO/SRA.
* clearAllMem.sh - clear all shared memory on current server.
* GSE_to_fastq.sh - Download GEO/SRA FASTQ files using a GSE accession.
* load_rnaseq_to_gemma.py - Push a processed GSE to Gemma.
* parse_miniml.py - Parse the locally downloaded MINIML file matching your GSE accession.
* parse_minimlPF.py - Works like parse_miniml.py but with restricted platforms. (This could/should extend parse_miniml.py)
* qc_download.sh - Scheduler task; perform qc of the downloaded files (e.g. sample numbers is what was expected by the curator.)
* star-clear-shmem.sh - Clear shared memories on all $MACHINES defined by the configurations.

### Metadata gathering
The scripts are specific to the `GatherMetadataGSE` task, which is responsible for collecting metadata and statistics on the data before the `PurgeGSE` task.
* alignment_metadata.sh - Obtain STAR metadata by fetching.
* pipeline_metadata.sh - Summary statistics on the datasets (Number of reads, parsed fastq headers, config file etc.)
* qc_report.sh - Call fastqc on all files, and then multiqc.


### ad-hoc
These scripts aren't be part of the pipeline but can be useful for ad-hoc usage/one off jobs. Use with care.

* benchmarker.sh - Run a timed command with ouputs to a benchmark sub-directory.
* fix-gene_id-for-gtf.sh - Unclear. Seems to replace gtf gene_id to transcript_id.
* makeReport.R - Old code to generate count matrices and report statistics.
* reads_per_samples.sh - Count all reads in a FASTQ file, for all samples.
* samplist-DIRTY.sh - Sample lists with -L in find (allows traversal of symlinks.)
* SA_download_miniml.sh - Standalone miniml download. Unclear purpose.
* SRP_to_fastq.sh - Download FASTQ files using only the SRP (SRA Project ID).
* transcript_lengths.sh - transcript lengths from the GTF.
* trim_fastq.sh - Run ngs-bits seqpurge to trim sequences.
* trimproject.sh - Not maintained - run trim_fastq.sh on the whole projects.
