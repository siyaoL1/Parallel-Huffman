# Parallelized Huffman Coding for Image Compression

### Directory Structure

In this project, we provide a sequential and parallel implementation of Huffman coding algorithm for image compression. Both parallel and sequential source code locates in `/code` folder. You can find testing image in the `/images` folder, and milestone deliverable inside `/milestone` folder.

### Environment Setup

Inside FAS shell access, load the required module by running the command:

```
module load gcc/10.2.0-fasrc01  openmpi/4.1.1-fasrc01 hdf5/1.12.1-fasrc01
```

## Testing Script

All the experiement involves with the image `/images/image.RW2` file, the testing script will compress the file and generate a `image.RW2.compressed` at the `/images` directory. To decompress the file follow the instruction on the next section.

Before running the testing script, make sure that you are inside the proper parallel/sequential directory. For parallel implementation run `cd code/parrallel`.

### General

```
sbatch --nodes=# --ntasks-per-node=# --cpus-per-task=# job.sh
```

* `--nodes=1`: Requesting one node.
* `--ntasks-per-node=4`: Requesting four tasks per node.
* `--cpus-per-task=1`: Requesting one CPU per task.

### Multi-thread - Frequency Analysis

Running frequency analysis with 32 cores.

```
sbatch --nodes=1 --ntasks-per-node=1 --cpus-per-task=32 job.sh
```

### Multi-process - Parallel Writing

Running parallel writing with 4 processes.

```
sbatch --nodes=1 --ntasks-per-node=4 --cpus-per-task=1 job.sh
```

### Conduct Experiement

Since parallel writing appears to be slowing runtime down, we provide only experiment for the multi-thread frequency analysis.

```
sbatch multi_core_experiment.sh
```

### Baseline Model

To run baseline model, simply run `make` inside of `/code/sequential` and run

```
./archive ../../images/image.RW2
```

## Extract Compressed File

Run `make` inside `/code/parallel/` folder, and run

```
./extract ../../images/image.RW2.compressed
```

Then the compressed image will be decompressed and stored at `/images` directory.
