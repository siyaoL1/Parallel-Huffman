#!/usr/bin/env bash
#SBATCH --job-name=multi_core
#SBATCH --output=multi_core_%j.out
#SBATCH --error=multi_core_%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=00:04:00

# set the number of OpenMP threads per MPI process
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

IMAGE_PATH="../../images/image.RW2"
NUM_CPUS=$SLURM_CPUS_PER_TASK
NUM_PROCESS=$SLURM_CPUS_PER_TASK

make

for NUM_CPUS in 1 2 4 8 16 32
do
    echo "Running with $NUM_CPUS CPUs"
    srun ./archive "$IMAGE_PATH" "$NUM_CPUS" "$NUM_PROCESS"
done

# return the exit code of srun above
exit $?
