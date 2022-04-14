from functools import reduce
def deep_get(dictionary,keys, default=None):
    a = reduce(lambda z, key: z.get(key, default) if isinstance(z, dict) else default, keys.split("/"), dictionary)
    if isinstance(a, str):
        return a
    else:
        return None