// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCfB4GMmewCK-o9rfRsL4suiAKx3qeiNB4",
  authDomain: "dust-wallet-ecb72.firebaseapp.com",
  projectId: "dust-wallet-ecb72",
  storageBucket: "dust-wallet-ecb72.appspot.com",
  messagingSenderId: "414661328706",
  appId: "1:414661328706:web:fc0347968da4af1da292db",
  measurementId: "G-BEBX46WHV2"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);