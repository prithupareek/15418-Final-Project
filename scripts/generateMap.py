# generateMap.py
import sys
from PIL import Image

if __name__ == "__main__":
    if len(sys.argv) != 3:
        sys.exit("Usage: python3 generateMap.py {image_file_name} {output_file_name}")
    
    imageFileName = sys.argv[1]
    mapFileName = sys.argv[2]

    im = Image.open(imageFileName)
    width, height = im.size

    output = open(mapFileName, "w")

    for y in range(height):
        for x in range(width):
            coordinate = x,y
            px = im.getpixel(coordinate)
            if (px > 0):
                output.write('1')
            else:
                output.write('0')
        output.write("\n")
    output.write("\n")
    output.close()
    print("Done writing to file")

