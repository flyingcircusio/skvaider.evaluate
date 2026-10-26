import os
import subprocess

def main():
    eval_script = os.path.join(os.path.dirname(__file__), "eval_dummy.py")
    
    if os.path.exists(eval_script):
        subprocess.run(["python3", eval_script], check=True)

if __name__ == "__main__":
    main()
