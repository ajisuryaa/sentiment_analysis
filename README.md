# Sentiment Analysis Flutter App

A Flutter application for analyzing the sentiment of user-provided text. The app leverages the [tabularisai/multilingual-sentiment-analysis](https://huggingface.co/tabularisai/multilingual-sentiment-analysis) model from Hugging Face, which is capable of classifying text in multiple languages into sentiment categories: **Very Negative**, **Negative**, **Neutral**, **Positive**, and **Very Positive**. When a user submits text, the app sends it to this model, which returns both the predicted sentiment label and a corresponding sentiment score. These results are then displayed in the app with color-coded labels and their respective scores, providing a clear and intuitive visualization of the sentiment analysis.

## Project Specification

### Features

- **Text Input:** Users can enter any text in multiple languages for sentiment analysis.
- **Sentiment Analysis:** The app sends the input text to the Hugging Face model API and receives both the predicted sentiment label and a confidence score for each category.
- **Result Display:** Results are shown with color-coded labels and their corresponding scores, making it easy to interpret the sentiment.
- **Reset Functionality:** Users can reset the input and results to analyze new text.
- **Responsive UI:** The interface is designed to be clean, modern, and responsive across different device sizes.

### Technical Details

- **Frontend:** Built with Flutter, using Material Design components for a native look and feel.
- **Backend Integration:** Communicates with the Hugging Face Inference API to perform sentiment analysis.
- **Model:** Utilizes the `tabularisai/multilingual-sentiment-analysis` model, which supports multiple languages and provides both label and score outputs.
- **Error Handling:** Displays user-friendly error messages in case of network issues or invalid input.

### Usage Flow

1. User enters text into the input field.
2. User submits the text for analysis.
3. The app sends a request to the Hugging Face API.
4. The API returns sentiment labels and scores.
5. The app displays the results with appropriate color coding.
6. User can reset the form to analyze new text.

### Requirements

- Flutter SDK 3.16.5
- Dart Version 3.2.3
- DevTools version 2.28.4
- Internet connection (for API requests)
- (Optional) Hugging Face API key for higher rate limits

### Future Enhancements

- Support for batch analysis of multiple texts.
- Visualization of sentiment trends over time.
- Offline sentiment analysis using on-device models.
- Customizable color themes and accessibility improvements.

## Screenshots

Below are some screenshots demonstrating the main features and user interface of the Sentiment Analysis Flutter App:

| Home Screen                                 | Sentiment Result                                |
| ------------------------------------------- | ----------------------------------------------- |
| ![Home Screen](screenshots/home_screen.png) | ![Result Screen](screenshots/result_screen.png) |

_Note: Screenshots are located in the `screenshots/` directory. If you are running the app locally, you can generate your own screenshots to replace or supplement these._
