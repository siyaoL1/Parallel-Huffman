#!/usr/bin/env bash
#SBATCH --job-name=multi_process
#SBATCH --output=multi_process_%j.out
#SBATCH --error=multi_process_%j.err
#SBATCH --time=00:04:00

# set the number of OpenMP threads per MPI process
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

IMAGE_PATH="../../images/image.RW2"
NUM_CPUS=$SLURM_CPUS_PER_TASK
NUM_PROCESS=$SLURM_CPUS_PER_TASK

make

srun ./archive "$IMAGE_PATH" "$NUM_CPUS" "$NUM_PROCESS"

# return the exit code of srun above
exit $?
