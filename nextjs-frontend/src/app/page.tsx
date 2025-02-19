import { connection } from "next/server";

export default async function Home() {
  await connection()
  if (!process.env.COLOR_API_URL) {
      return (
          <div className="flex flex-row items-center flex-1 h-screen justify-center">
              <h2 className="text-4xl font-bold text-center">
                Ich kann keine COLOR_API_URL Umgebungsvariable finden!
              </h2>
          </div>
        );
  }

  const { hex } = await fetch(process.env.COLOR_API_URL + "/color").then((res) => res.json());
    
  console.log(hex)
  return (
    <div style={{
      backgroundColor: hex,
    }} className="flex flex-row items-center flex-1 h-screen justify-center">
      <h2 className="text-4xl font-bold text-center">
        Kubernetes rocks!
      </h2>
    </div>
  );
}
