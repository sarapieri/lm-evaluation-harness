
def doc_to_text(doc) -> str: 
    choices = "\n".join([f"({k}) {v}" for i, (k, v) in enumerate(doc["options"].items()) if v is not None])
    return f"Question: {doc['question']}\n{choices}\nAnswer:"

def doc_to_target(doc) -> str:
    return "{}".format(doc["answer_idx"])

# def gold_alias(doc):
#     return ord(doc["final_decision"]) - ord("A")