# Exercise Documentation

## Data
We took the transcripts from season 3, 5, 6, and 8 of the TV-series FRIENDS to train our model.
The data was obtainted from https://github.com/emorynlp/character-mining/tree/master/json and saved in data/raw.

## Preprocessing
As the transcripts were in json, the data had to be converted to .txt using ```scripts/read_json.py``` (for the corpus of each season separately; each season name has to be inputted manually) and concatenated to one file (```data/raw/friends.txt```). This file was then preprocessed using ```./scripts/prepare_friends_data.sh``` (an adapted version of ```scripts/download_data.sh```). As the segments in our corpus are quite short, we chose to indrease the number of training segments to 7000.

The ready-to-train data is stored under ```data/friends_clean```.

## Training

We chose dropout for our parameter experiment and trained 8 models using ```./scripts/train.sh```.

 | Dropout | test loss | test ppl | 
 | :---: | :---: | :---: | 
 | 0.9 | 4.77 | 117.69 | 
 | 0.7 | 4.25 | 69.83 | 
 | 0.5 | 4.15 | 63.54 | 
 | 0.45 | 4.15 | 63.55 | 
 | 0.4 | 4.15 | 63.72 | 
 | 0.3 | 4.17 | 64.44 | 
 | 0.1 | 4.21 | 67.12 | 
 | 0.0 | 4.30 | 73.89 | 

Interestingly, the default setting of 0.5 turned out lead to the lowest test perplexity.
The models in the models folder are numbered according to their dropout parameter (model07.pt was trained on a dropout of 0.7).

## Generating

Generation of text was done by ```./scripts/generation.sh```.


>**300 words on dropout of 0.45 (```sample045.txt```)**:
her . It &apos;s not going to be unreasonable . <eos> I swear that out honey , there is that
okay who Ross and someone took you <unk> a expecting , but what is going on ? <eos> Well ,
you should just shut your floating <unk> . No right now , we-we &apos;re just my son dress at the
decision . <unk> at your house &apos; shop in a head ! And wink , oh ... It was just
someone in the right I &apos;ll pick you on her . <eos> You think you &apos;ve made out of candy
? <eos> I &apos;m thinking . Maybe you were there from Valentine &apos;s impulsive . Oh , at you thought
to eat the time . It &apos;s really gonna have them so cute enough . <eos> Ross , are you
ready ? ! <eos> I &apos;m sorry ! <eos> Hey ! God I know ! This is my small story
? ! Look , that &apos;s a a million thing ! <eos> Yeah ! <eos> But ... Here was nice
in over here , <unk> if you need around to me over with slip fun ! I mean I never
wanted some hormones do . <eos> Annie ? shaving ? <eos> Open late . <eos> So where was that ?
<eos> Umm , thank you . Oh , I &apos;m so happy ! I tried the ring to tell me
why I was talking about London . <eos> So this is such a baby . I was across these ring
when I have no pathetic for me . <eos> No , y &apos;know what ? And imagine , all it
out with that <unk> , then then I want marriage to <unk> , high year ... We will so watch

All in all, the generated text is reminiscent of actual FRIENDS dialogs. We can see everal key words and topics being mentioned. As the dialogs in the show are quite short, the generated sentences also only consist of a few words. The "&apos" tags in the raw output are not very nice and could be dealt with during preprocessing.

## Experiments with greedy search

Text generation has also been tested using *greedy search* (implemented in https://github.com/lucasseiler/examples).


# Original Documentation

## Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model).

## Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

## Steps

Clone this repository in the desired place:

    git clone https://github.com/bricksdont/pytorch-rnn-lm
    cd pytorch-rnn-lm

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh
