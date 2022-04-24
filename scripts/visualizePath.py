# visualizePath.py
import sys
import matplotlib.pyplot as plt
import numpy as np
from tqdm import tqdm

if __name__ == "__main__":
    if len(sys.argv) != 4:
        sys.exit("Usage: python3 visualizePath.py {path_file_name} {map_file_name} {output_image_file}")
    
    pathFileName = sys.argv[1]
    mapFileName = sys.argv[2]
    outputImageFile = sys.argv[3]

    map = []
    mapFile = open(mapFileName, "r")
    for line in tqdm(mapFile):
        inner_list = [int(x) for x in list(line.replace("\n", ""))]
        map.append(inner_list)
    mapFile.close()

    pathFile = open(pathFileName, "r")
    for line in tqdm(pathFile):
        point = line[line.find("(")+1:line.find(")")].split(",")
        x = int(point[0])
        y = int(point[1])
        map[y][x] = 2

    for x in tqdm(range(len(map))):
        for y in range(len(map[x])):
            if map[x][y] == 0:
                map[x][y] = [255, 255, 255]
            elif map[x][y] == 1:
                map[x][y] = [0, 0, 0]
            elif map[x][y] == 2:
                map[x][y] = [255, 0, 0]

    # print(map)

    map = np.asarray(map, dtype=np.uint8)

    plt.imsave(outputImageFile, map)