import { ThemeToggle } from "@/components/molecules/ThemeToggle";
import { Button } from "@/components/atoms";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center gap-8 p-24 bg-background text-foreground">
      <h1 className="text-4xl font-bold text-primary">Portal Administrativo</h1>
      
      <div className="flex flex-col items-center gap-4">
        <p className="text-muted-foreground">Theme System Validation</p>
        <ThemeToggle />
      </div>

      <div className="grid grid-cols-2 gap-4 p-8 border rounded-xl bg-card">
        <Button>Primary Button</Button>
        <Button variant="secondary">Secondary Button</Button>
        <Button variant="destructive">Destructive Button</Button>
        <Button variant="outline">Outline Button</Button>
        <Button variant="ghost">Ghost Button</Button>
        <Button variant="link">Link Button</Button>
      </div>
    </main>
  );
}
