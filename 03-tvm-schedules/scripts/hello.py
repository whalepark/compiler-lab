try:
    import tvm
    print("TVM import OK:", tvm.__version__)
except Exception as e:
    print("TVM not available:", e)
