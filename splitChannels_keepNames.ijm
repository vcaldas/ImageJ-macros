//setBatchMode(true); 

// In ImageJ, when a stack is split, the names are not kept.
// This macro stores the names of the original stack, split the channels and rename all 
//labels

// Author: caldas.victor@gmail.com
// Please report bugs or add your suggestions on the issues page.

slice_names = newArray(nSlices+1);

// Store names of slices in array
for (i=1; i<=nSlices; i++) {
	setSlice(i); 
	slice_names[i] = getInfo("slice.label");
	print(slice_names[i]);
}

run("Split Channels");
// Loop over each channel
for(i=1; i <= nImages; i++){
	selectImage(i);
	imageName = getTitle();
	// Rename slices
	for (j=1; j<=nSlices; j++) {
	setSlice(j); 
	print(slice_names[j]);
	setMetadata(slice_names[j] + "_" +  imageName);
	}
}


