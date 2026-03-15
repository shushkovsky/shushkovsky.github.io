---
layout: default
permalink: /beachSoccer/
title: Beach Soccer
nav: true
nav_order: 4
---

<div class="beach-soccer-page">
    <h1>Beach Soccer Clips</h1>
    <p class="selector-label">Select a date</p>

    <div class="date-grid" id="dateSelector" aria-label="Beach soccer session dates"></div>

    <section class="video-panel card" aria-live="polite">
        <h2 id="selectedDateLabel">No date selected</h2>
        <p class="empty-state" id="emptyState">Choose a date card to load clips.</p>
        <div class="video-container" id="videoContainer"></div>
    </section>
</div>

<style>
    .beach-soccer-page {
        max-width: 900px;
        margin: 0 auto;
    }

    .beach-soccer-page h1 {
        margin-bottom: 0.5rem;
        color: var(--global-text-color);
    }

    .selector-label {
        margin-bottom: 1rem;
        color: var(--global-text-color-light);
    }

    .date-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
        gap: 0.75rem;
        margin-bottom: 1.5rem;
    }

    .date-card {
        border: 1px solid var(--global-divider-color);
        border-radius: 0.5rem;
        background-color: var(--global-card-bg-color);
        color: var(--global-text-color);
        padding: 0.85rem 1rem;
        text-align: left;
        cursor: pointer;
        transition: border-color 0.2s ease, transform 0.2s ease;
    }

    .date-card:hover,
    .date-card:focus-visible {
        border-color: var(--global-theme-color);
        transform: translateY(-1px);
        outline: none;
    }

    .date-card.is-selected {
        border-color: var(--global-theme-color);
        background-color: var(--global-theme-color);
        color: var(--global-hover-text-color);
    }

    .video-panel {
        padding: 1rem;
        border: 1px solid var(--global-divider-color);
        border-radius: 0.75rem;
    }

    .video-panel h2 {
        margin-top: 0;
        margin-bottom: 0.5rem;
        font-size: 1.125rem;
    }

    .empty-state {
        margin-bottom: 0.75rem;
        color: var(--global-text-color-light);
    }

    .video-container {
        display: grid;
        grid-template-columns: 1fr;
        gap: 1rem;
    }

    .video-container video {
        width: 100%;
        border: 1px solid var(--global-divider-color);
        border-radius: 0.5rem;
        background-color: var(--global-bg-color);
    }
</style>

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
        "2026-01-24": [
            { fileName: "Screen Recording 2026-01-26 at 4.32.51 PM.mov", type: "video/quicktime" },
        ],
        "2026-02-18": [
            { fileName: "Screen Recording 2026-02-20 at 1.29.35 PM.mov", type: "video/quicktime" },
            { fileName: "Screen Recording 2026-02-20 at 2.44.00 PM.mov", type: "video/quicktime" },
        ],
    };

    const basePath = '{{ "/assets/video/beachSoccer/" | relative_url }}';
    const dateSelector = document.getElementById("dateSelector");
    const selectedDateLabel = document.getElementById("selectedDateLabel");
    const emptyState = document.getElementById("emptyState");
    const videoContainer = document.getElementById("videoContainer");
    const dateFormatter = new Intl.DateTimeFormat("en-US", {
        month: "long",
        day: "2-digit",
        year: "numeric",
    });

    function toReadableDate(dateString) {
        return dateFormatter.format(new Date(`${dateString}T00:00:00`));
    }

    function selectDate(selectedDate, clickedButton) {
        videoContainer.innerHTML = "";

        document.querySelectorAll(".date-card").forEach((button) => {
            button.classList.remove("is-selected");
            button.setAttribute("aria-pressed", "false");
        });

        clickedButton.classList.add("is-selected");
        clickedButton.setAttribute("aria-pressed", "true");
        selectedDateLabel.textContent = toReadableDate(selectedDate);

        const clips = videoData[selectedDate] || [];
        if (!clips.length) {
            emptyState.textContent = "No clips available for this date.";
            return;
        }

        emptyState.textContent = "";
        clips.forEach((video) => {
            const videoElement = document.createElement("video");
            videoElement.controls = true;
            videoElement.playsInline = true;

            const sourceElement = document.createElement("source");
            sourceElement.src = `${basePath}${selectedDate}/${video.fileName}`;
            sourceElement.type = video.type;

            videoElement.appendChild(sourceElement);
            videoContainer.appendChild(videoElement);
        });
    }

    Object.keys(videoData)
        .sort((a, b) => (a < b ? 1 : -1))
        .forEach((dateKey) => {
            const button = document.createElement("button");
            button.type = "button";
            button.className = "date-card";
            button.textContent = toReadableDate(dateKey);
            button.setAttribute("aria-pressed", "false");
            button.addEventListener("click", () => selectDate(dateKey, button));
            dateSelector.appendChild(button);
        });
</script>
