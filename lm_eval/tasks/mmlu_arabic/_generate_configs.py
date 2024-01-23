"""
Take in a YAML, and output all other splits with this YAML
"""
import os
import yaml
import argparse

from tqdm import tqdm

from lm_eval import utils
from lm_eval.logger import eval_logger

SUBJECTS = [
    "anatomy_arabic",
    "clinical_knowledge_arabic",
    "college_biology_arabic",
    "college_medicine_arabic",
    "medical_genetics_arabic",
    "professional_medicine_arabic",
]

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--base_yaml_path", required=True)
    parser.add_argument("--save_prefix_path", default="flan")
    parser.add_argument("--cot_prompt_path", default=None)
    parser.add_argument("--task_prefix", default="")
    return parser.parse_args()


if __name__ == "__main__":

    args = parse_args()

    # get filename of base_yaml so we can `"include": ` it in our other YAMLs.
    base_yaml_name = os.path.split(args.base_yaml_path)[-1]
    with open(args.base_yaml_path) as f:
        base_yaml = yaml.full_load(f)

    if args.cot_prompt_path is not None:
        import json

        with open(args.cot_prompt_path) as f:
            cot_file = json.load(f)

    for subject in tqdm(SUBJECTS):
        if args.cot_prompt_path is not None:
            description = cot_file[subject]
        else:
            description = f"The following are multiple choice questions (with answers) about {' '.join(subject.split('_'))}.\n\n"

        yaml_dict = {
            "include": base_yaml_name,
            # "task": f"mmlu_{args.task_prefix}_{subject}_arabic"
            # if args.task_prefix != ""
            # else f"mmlu_{subject}_arabic",
            # "dataset_name": subject,
            # "description": description,
        }

        file_save_path = args.save_prefix_path + f"_{subject}.yaml"
        eval_logger.info(f"Saving yaml for subset {subject} to {file_save_path}")
        with open(file_save_path, "w") as yaml_file:
            yaml.dump(
                yaml_dict,
                yaml_file,
                width=float("inf"),
                allow_unicode=True,
                default_style='"',
            )
