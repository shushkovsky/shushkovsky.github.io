---
layout: default
permalink: /beachSoccer/
title: Beach Soccer
nav: true
nav_order: 4
---

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beach Soccer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f8ff;
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            color: #333; /* Changed to black */
            font-size: 2em;
            margin-bottom: 20px;
        }
        .dropdown {
            margin: 20px 0;
        }
        .dropdown select {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px; /* Rounded corners */
            border: 1px solid #ddd;
            background-color: #fff;
            color: #333;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            appearance: none; /* Remove default styling */
            outline: none;
            transition: border-color 0.3s ease;
        }
        .dropdown select:hover, .dropdown select:focus {
            border-color: #ffa500; /* Soft orange color on hover/focus */
        }
        .video-container {
            margin-top: 20px;
            display: none;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 650px; /* Max-width to center the container */
        }
        video {
            width: 100%;
            max-width: 600px;
            margin-bottom: 20px; /* Space between videos */
            border: 2px solid #ffa500; /* Soft orange border */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow */
        }
    </style>
</head>
<body>
    <h1>Beach Soccer Clips</h1>
    <div class="dropdown">
        <select id="videoSelector">
            <option value="" selected disabled>Select a date</option>
            <option value="2024-07-07">July 07, 2024</option>
            <option value="2024-07-19">July 19, 2024</option>
            <option value="2024-07-20">July 20, 2024</option>
            <option value="2024-07-22">July 22, 2024</option>
            <!-- Add more options as needed -->
        </select>
    </div>
    <div class="video-container" id="videoContainer"></div>
    <script>
        const videoData = {
            "2024-07-07": [
                { fileName: "clip01.mov", type: "video/quicktime" },
                { fileName: "clip03.mov", type: "video/quicktime" },
            ],
            "2024-07-19": [
                { fileName: "clip01.mov", type: "video/quicktime" },
                { fileName: "clip02.mov", type: "video/quicktime" },
                { fileName: "clip03.mov", type: "video/quicktime" },
                { fileName: "clip04.mov", type: "video/quicktime" },
                { fileName: "clip05.mov", type: "video/quicktime" },
            ],
            "2024-07-20": [
                { fileName: "clip01.mov", type: "video/quicktime" },
                { fileName: "clip02.mov", type: "video/quicktime" },
                { fileName: "clip03.mov", type: "video/quicktime" },
                { fileName: "clip04.mov", type: "video/quicktime" },
            ],
            "2024-07-22": [
                { fileName: "clip01.mov", type: "video/quicktime" },
                { fileName: "clip02.mov", type: "video/quicktime" },
            ],
            // Add more dates with their respective clips
        };
        const basePath = '{{ "assets/video/beachSoccer/" | relative_url }}';
        document.getElementById('videoSelector').addEventListener('change', function() {
            var selectedDate = this.value;
            var videoContainer = document.getElementById('videoContainer');
            videoContainer.innerHTML = ''; // Clear previous videos
            if (selectedDate in videoData) {
                videoData[selectedDate].forEach(video => {
                    var videoElement = document.createElement('video');
                    videoElement.controls = true;
                    var sourceElement = document.createElement('source');
                    sourceElement.src = `${basePath}${selectedDate}/${video.fileName}`;
                    sourceElement.type = video.type;
                    videoElement.appendChild(sourceElement);
                    videoContainer.appendChild(videoElement);
                });
                videoContainer.style.display = 'flex';
            } else {
                videoContainer.style.display = 'none';
            }
        });
    </script>
</body>
</html>
