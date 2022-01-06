# 109服务器
# mean teacher
CUDA_VISIBLE_DEVICES=4 python meanteacher.py --c config/meanteacher/meanteacher_cifar100_400_1.yaml
CUDA_VISIBLE_DEVICES=5 python meanteacher.py --c config/meanteacher/meanteacher_cifar100_10000_1.yaml

# baseline
CUDA_VISIBLE_DEVICES=6 python pseudolabel.py --c config/pseudolabel/pseudolabel_cifar100_400_1.yaml
CUDA_VISIBLE_DEVICES=7 python pseudolabel.py --c config/pseudolabel/pseudolabel_cifar100_10000_1.yaml

# clean baseline
CUDA_VISIBLE_DEVICES=4 python pseudolabel.py --c config/pseudolabel/pseudolabel_cifar100_400_1.yaml
CUDA_VISIBLE_DEVICES=5 python pseudolabel.py --c config/pseudolabel/pseudolabel_cifar100_10000_1.yaml

# fix match
CUDA_VISIBLE_DEVICES=2,3,6,7 python fixmatch.py --c config/fixmatch/fixmatch_cifar100_10000_1.yaml

# tensorboard
tensorboard --logdir='/workspace2/chenbaixu/TorchSSL/saved_models' --port=6006 --bind_all

# 101服务器
# fix match
CUDA_VISIBLE_DEVICES=0,1,2,3 python fixmatch.py --c config/fixmatch/fixmatch_cifar100_400_1.yaml
CUDA_VISIBLE_DEVICES=4,5,6,7 python fixmatch.py --c config/fixmatch/fixmatch_cifar100_10000_1.yaml

# tensorboard
tensorboard --logdir='/home/chenbaixu/TorchSSL/saved_models' --port=6006 --bind_all

# fix match 8卡
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python fixmatch.py --c config/fixmatch/fixmatch_cifar100_400_1.yaml
# flex match 8卡
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python flexmatch.py --c config/flexmatch/flexmatch_cifar100_400_1.yaml

# 103服务器
# flex match
# 400
CUDA_VISIBLE_DEVICES=0 python flexmatch.py --c config/flexmatch/flexmatch_cifar100_400_1.yaml
# 2500
CUDA_VISIBLE_DEVICES=0 python flexmatch.py --c config/flexmatch/flexmatch_cifar100_2500_1.yaml
# 10000
CUDA_VISIBLE_DEVICES=1 python flexmatch.py --c config/flexmatch/flexmatch_cifar100_10000_1.yaml

# fix match
# 400
CUDA_VISIBLE_DEVICES=1 python fixmatch.py --c config/fixmatch/fixmatch_cifar100_400_1.yaml
# 2500
CUDA_VISIBLE_DEVICES=0 python fixmatch.py --c config/fixmatch/fixmatch_cifar100_2500_1.yaml
# 10000
CUDA_VISIBLE_DEVICES=1 python fixmatch.py --c config/fixmatch/fixmatch_cifar100_10000_1.yaml
