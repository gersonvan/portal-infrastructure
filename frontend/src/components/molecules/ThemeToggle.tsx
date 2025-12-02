'use client';

import React from 'react';
import { useTheme } from '@/contexts/ThemeContext';
import { Button } from '@/components/atoms/Button/Button';

export function ThemeToggle() {
  const { theme, setTheme } = useTheme();

  return (
    <div className="flex gap-4 p-4 border rounded-lg bg-card text-card-foreground shadow-sm">
      <div className="flex flex-col gap-2">
        <h3 className="font-semibold">Current Theme: {theme.toUpperCase()}</h3>
        <div className="flex gap-2">
          <Button 
            variant={theme === 'avp' ? 'default' : 'outline'} 
            onClick={() => setTheme('avp')}
          >
            AVP Theme
          </Button>
          <Button 
            variant={theme === 'unigrande' ? 'default' : 'outline'} 
            onClick={() => setTheme('unigrande')}
          >
            Unigrande Theme
          </Button>
        </div>
      </div>
    </div>
  );
}
