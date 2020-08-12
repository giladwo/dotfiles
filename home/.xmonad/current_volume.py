#!/bin/env python3

import subprocess
import re


def get_current_volume():
    matches = re.finditer("\[(\d+)%\] \[on\]", subprocess.check_output("amixer get Master".split()).decode())
    volumes = [int(match.group(1)) for match in matches]
    return sum(volumes) / len(volumes) if volumes else None


if __name__ == "__main__":
    volume = get_current_volume()
    print("N/A" if volume is None else int(volume))

