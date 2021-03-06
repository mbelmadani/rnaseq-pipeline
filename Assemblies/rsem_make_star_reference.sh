#!/bin/bash
set -eu
source ../etc/load_configs.sh

if [ $# -lt 2 ]
    then
    echo "Usage:"
    echo $0" SPECIESNAME /path/to/iGenome VERSION"
    echo "Example:"
    SPECIES="human"
    GENOME="Homo_sapiens/NCBI/GRCh38/"
    VERSION="ncbi38"
    echo $0" $SPECIES $GENOME $VERSION"
    echo "Output:"
    echo "$ASSEMBLIES/runtime/"$SPECIES"_ref"$VERSION"/"$SPECIES"_0""*"
    exit -1
fi

SPECIES=$1
GENOME_PATH=$2
FORMAT="--gtf"
if [ $# -lt 3 ]; then
    VERSION=""
else
    VERSION=$3
fi

if [ $# -eq 4 ]; then
    FORMAT="$4"
fi

EXE="$RSEM_DIR/rsem-prepare-reference"
GTF="$ASSEMBLIES/"$GENOME_PATH"/Annotation/Genes/genes.gtf"
if [ "$FORMAT" == "--gff3" ]; then
    GTF="$ASSEMBLIES/"$GENOME_PATH"/Annotation/GFF/genes.gff"
fi

GENOME="$ASSEMBLIES/"$GENOME_PATH"/Sequence/WholeGenomeFasta/genome.fa"
OUTPUT="$ASSEMBLIES/runtime/"$SPECIES"_ref"$VERSION"/"$SPECIES"_0"

echo "GTF:" $GTF
echo "Genome sequences:" $GENOME

mkdir -p $( dirname $OUTPUT )
$EXE $FORMAT $GTF \
     --star \
     --star-path $STAR_PATH \
     -p 8 \
    $GENOME \
    $OUTPUT 
    
