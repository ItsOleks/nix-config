lib: {
  switch = key: attrset:
    if attrset ? "${key}" then
      attrset."${key}"
    else
      attrset.default;
} 
