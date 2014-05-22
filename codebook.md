Codebook for Courcera Getting and Cleaning Data Course Project
========================================================

This describes the column names used in tidydata.csv and avg_data.csv.  The columns are the same in these two files.  tidydata.csv contains the individual observations, and avg_data.csv contains mean values grouped by Subject and Activity.

<h3>Subject</h3>
Unique subject number.

<h3>Dataset</h3>
The datashet the observation came from. 
<ul>
<li>TEST</li>
<li>TRAIN</li>
</ul>

<h3>Activity</h3>
The activity of the subject.
<ul>
<li>WALKING</li>
<li>WALKING_UPSTAIRS</li>
<li>WALKING_DOWNSTAIRS</li>
<li>SITTING</li>
<li>STANDING</li>
<li>LAYING</li>
</ul>

<h3>Measurements</h3>
<p>The remaining columns contain measurement data.  These are of the form:
[domain][signal]-[function]-[direction]<p>
<h4>domain</h4> "t" for time, or "f" for frequency.  Note the frequency data was obtained by applying an FFT to the time domain data.
<h4>signal</h4> The signal measured.
<H4>function</h4> "mean" for the estimated mean value, or "std" for the estimated standard deviation.
<H4>direction</h4>"X", "Y", or "Z" direction. Note not all signals are directional.

