# TesteVenturus

 Main Objective
The objective of the application is to fetch cats images from ​https://imgur.com​, and show the images on gallery.
Fetching the images
To fetch the images url, imgur requires two keys, you can use the following, or create a new pair if necessary.
You can send a GET to the following url to fetch the cat images, don't forget to include Client-ID on header authorization key, you can check if the API is working using the command line, For more information about the imgur use visit ​https://imgur.com
curl --header "Authorization: Client-ID 1ceddedc03a5d71" https://api.imgur.com/3/gallery/search/?q=cats
Showing the images
Create an iOS app with just one screen to show the fetched images in a gallery, use UICollectionView to display the gallery.
When you are done, create a public repository on Github and submit the code for evaluation.
   CLIENT ID
1ceddedc03a5d71
  CLIENT SECRET
63775118a9f912fd91ed99574becf3b375d9 eeca
    
