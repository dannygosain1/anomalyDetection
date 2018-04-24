# Anomaly Detection - URA Winter 2018

### System Requirements
1. ffmpeg for frame extraction from video
2. OpenMP
```
sudo apt-get install gcc-multilib
```
3. Python 3 (the framework can run on Python 2, but the feature extraction can only be done in Python 3)

### Using python virtualenv to run the framework - perform these steps inside the framework directory

Install virtualenv
`pip install virtualenv`

Create the 'vanilla' virtual env
`virtualenv anomalyframework_virtualenv`

Activate the virtual environment
`bash anomalyframework_virtualenv/bin/activate`

Install the packages from requirements.txt
`pip install -r requirements.txt`

When running code from this repository, you can then either activate the virtual environment each time (and use `python`, `ipython` as normal), or execute `anomalyframework_virtualenv/bin/python` to circumvent the activation, and call the executables directly.

Run the following script - ```runscript.py``` located in the framework directory

### Key Points

1. The image extraction from a video was done using ffmpeg
```
ffmpeg -i input-file.mp4 -r 1/1 $filename%03d.bmp
```
2. For feature extraction, dense daisy method was used on sklearn. The implementation can be found in the jupyter notebook *plot_daisy.ipynb* located in the featureExtraction directory

3. Creation of .train file (libsvm format) was done in the same notebook mentioned above. The .train file from my run is included in the trainFiles directory

4. The ```runscript.py``` points to the .train file to run it against the framework. It also runs pca on the frames which we dont need since that was completed before making the .train file.
```
infile_features_libsvm = '../first_run.train' # location of the train file
lambd = 1000.0
if not os.path.isfile(infile_features_libsvm):
    print('Creating the .train file for {}'.format(infile_features))
    X = np.load(infile_features)
    liblinear_utils.write(X, y=None, outfile=infile_features_libsvm, zero_based=True)

# Run anomaly detection
a, pars = run.main(infile_features=infile_features_libsvm, n_shuffles=10, lambd=lambd)
```

5. The frameworks generates the anomaly ratings for each frame and marks the locations in .numpy, and creates and .pickle file for the parameters. The results from my runs are located inside anomalyframework_python/build/results/
