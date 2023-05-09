import wandb
import time


class Logger:
    def __init__(self):
        self.is_init = False

    def log(self, args, dict):

        
        if args.use_wandb :
            if self.is_init is False:
                wandb.init(project=f"audioset",
                            name=f"{args.local_time}_{args.model_type}_{args.hop_size}_{args.mel_bins}_{args.loss_type}_{args.balanced}_{args.augmentation}")
                wandb.config.update(args)
                self.is_init = True

            wandb.log(dict)


web_logger = Logger()
