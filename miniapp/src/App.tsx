import { useEffect, useRef, useState } from "react";
import "./App.css";
import Style from "./main.module.sass";

declare global {
  interface Window {
    Telegram: any;
  }
}

function App() {
  const [ready, setReady] = useState(false);
  const [tele, setTele] = useState<any>(null);
  const textAreaRef = useRef<HTMLTextAreaElement>(null);

  useEffect(() => {
    const script = document.createElement("script");
    script.src = "https://telegram.org/js/telegram-web-app.js";

    script.onload = () => {
      window.Telegram.WebApp.ready();
      window.Telegram.WebApp.expand();
      setReady(true);
      setTele(window.Telegram.WebApp);
    };

    document.body.appendChild(script);
  }, []);

  const handleKeyPress = () => {
    console.log("press");
    if (!textAreaRef.current) return;

    textAreaRef.current.style.height = 0 + "px";
    textAreaRef.current.style.height =
      Math.max(textAreaRef.current.scrollHeight, 32) + "px";
  };

  return (
    <div className={Style.layout}>
      {ready && (
        <div className={Style.chatWrapper}>
          <div className={Style.chatContainer}>
            <div className={Style.chatMessages}>
              <div>{tele.initData}</div>
            </div>
            <div className={Style.chatBottom}>
              <textarea
                ref={textAreaRef}
                onKeyUp={handleKeyPress}
                className={Style.input}
              />
              <button>Send</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

export default App;
