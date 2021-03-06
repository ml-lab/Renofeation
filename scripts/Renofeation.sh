#!/bin/bash

iter=90000
i=1
splmda=0
layer=1234
lr=1e-2
wd=5e-3
mmt=0.9


# Flower
lmda=5e0
python -u train.py --iterations ${iter} --datapath /data/Flower_102/ --dataset Flower102Data --name resnet18_flower102_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i} --batch_size 64 --feat_lmda ${lmda} --lr ${lr} --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --reinit --dropout 1e-1 --log

python -u train.py --iterations 30000 --datapath /data/Flower_102/ --dataset Flower102Data --name resnet18_flower102_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i} --batch_size 64 --feat_lmda ${lmda} --lr 5e-3 --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --dropout 1e-1 --checkpoint ckpt/resnet18_flower102_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i}.pth --swa --swa_freq 500 --swa_start 0 --const_lr --log

python -u eval_robustness.py --datapath /data/Flower_102/ --dataset Flower102Data --network resnet18 --checkpoint ckpt/resnet18_flower102_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.pth > eval/resnet18_flower102_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.log


# Indoor
lmda=5e0
python -u train.py --iterations ${iter} --datapath /data/MIT_67/ --dataset MIT67Data --name resnet18_mit67_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i} --batch_size 64 --feat_lmda ${lmda} --lr ${lr} --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --reinit --dropout 1e-1 --log

python -u train.py --iterations 30000 --datapath /data/MIT_67/ --dataset MIT67Data --name resnet18_mit67_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i} --batch_size 64 --feat_lmda ${lmda} --lr 5e-3 --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --dropout 1e-1 --checkpoint ckpt/resnet18_mit67_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i}.pth --swa --swa_freq 500 --swa_start 0 --const_lr --log

python -u eval_robustness.py --datapath /data/MIT_67/ --dataset MIT67Data --network resnet18 --checkpoint ckpt/resnet18_mit67_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.pth > eval/resnet18_mit67_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.log


# Stanford40
lmda=5e0
python -u train.py --iterations ${iter} --datapath /data/stanford_40/ --dataset Stanford40Data --name resnet18_stanford40_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i} --batch_size 64 --feat_lmda ${lmda} --lr ${lr} --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --reinit --dropout 1e-1 --log

python -u train.py --iterations 30000 --datapath /data/stanford_40/ --dataset Stanford40Data --name resnet18_stanford40_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i} --batch_size 64 --feat_lmda ${lmda} --lr 5e-3 --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --dropout 1e-1 --checkpoint ckpt/resnet18_stanford40_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i}.pth --swa --swa_freq 500 --swa_start 0 --const_lr --log

python -u eval_robustness.py --datapath /data/stanford_40/ --dataset Stanford40Data --network resnet18 --checkpoint ckpt/resnet18_stanford40_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.pth > eval/resnet18_stanford40_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.log


# CUB200
lmda=1e0
python -u train.py --iterations ${iter} --datapath /data/CUB_200_2011/ --dataset CUB200Data --name resnet18_cub200_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i} --batch_size 64 --feat_lmda ${lmda} --lr ${lr} --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --reinit --dropout 1e-1 --log

python -u train.py --iterations 30000 --datapath /data/CUB_200_2011/ --dataset CUB200Data --name resnet18_cub200_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i} --batch_size 64 --feat_lmda ${lmda} --lr 5e-3 --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --dropout 1e-1 --checkpoint ckpt/resnet18_cub200_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i}.pth --swa --swa_freq 500 --swa_start 0 --const_lr --log

python -u eval_robustness.py --datapath /data/CUB_200_2011/ --dataset CUB200Data --network resnet18 --checkpoint ckpt/resnet18_cub200_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.pth > eval/resnet18_cub200_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.log


# DOG
lmda=5e0
python -u train.py --iterations ${iter} --datapath /data/stanford_dog/ --dataset SDog120Data --name resnet18_sdog120_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i} --batch_size 64 --feat_lmda ${lmda} --lr ${lr} --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --reinit --dropout 1e-1 --log

python -u train.py --iterations 30000 --datapath /data/stanford_dog/ --dataset SDog120Data --name resnet18_sdog120_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i} --batch_size 64 --feat_lmda ${lmda} --lr 5e-3 --network resnet18 --weight_decay ${wd} --beta 1e-2 --test_interval 1000 --feat_layers ${layer} --momentum ${mmt} --dropout 1e-1 --checkpoint ckpt/resnet18_sdog120_reinit_lr${lr}_iter${iter}_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_${i}.pth --swa --swa_freq 500 --swa_start 0 --const_lr --log

python -u eval_robustness.py --datapath /data/stanford_dog/ --dataset SDog120Data --network resnet18 --checkpoint ckpt/resnet18_sdog120_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.pth > eval/resnet18_sdog120_reinit_lr5e-3_iter30000_feat${lmda}_wd${wd}_mmt${mmt}_dropout1e-1_swa_${i}.log
