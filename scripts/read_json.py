#! /usr/bin/python3

import json

outfile = open("../data/friends03.txt", "w")
with open("../data/friends_season_03.json", "r") as json_file:
    data = json.load(json_file)
    for episode in data["episodes"]:
        for scene in episode["scenes"]:
            for utterance in scene["utterances"]:
                if utterance["transcript"]:
                    #print(utterance["transcript"])
                    outfile.write(utterance["transcript"]+"\n")
outfile.close()
