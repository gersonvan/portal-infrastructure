export interface Theme {
  name: string;
  colors: {
    background: string;
    foreground: string;
    card: string;
    cardForeground: string;
    popover: string;
    popoverForeground: string;
    primary: string;
    primaryForeground: string;
    secondary: string;
    secondaryForeground: string;
    muted: string;
    mutedForeground: string;
    accent: string;
    accentForeground: string;
    destructive: string;
    destructiveForeground: string;
    border: string;
    input: string;
    ring: string;
  };
  radius: string;
}

export const avpTheme: Theme = {
  name: 'avp',
  colors: {
    background: '0 0% 100%',
    foreground: '222.2 84% 4.9%',
    card: '0 0% 100%',
    cardForeground: '222.2 84% 4.9%',
    popover: '0 0% 100%',
    popoverForeground: '222.2 84% 4.9%',
    primary: '221.2 83.2% 53.3%', // Blue
    primaryForeground: '210 40% 98%',
    secondary: '24.6 95% 53.1%', // Orange
    secondaryForeground: '210 40% 98%',
    muted: '210 40% 96.1%',
    mutedForeground: '215.4 16.3% 46.9%',
    accent: '210 40% 96.1%',
    accentForeground: '222.2 47.4% 11.2%',
    destructive: '0 84.2% 60.2%',
    destructiveForeground: '210 40% 98%',
    border: '214.3 31.8% 91.4%',
    input: '214.3 31.8% 91.4%',
    ring: '221.2 83.2% 53.3%',
  },
  radius: '0.5rem',
};

export const unigrandeTheme: Theme = {
  name: 'unigrande',
  colors: {
    background: '0 0% 100%',
    foreground: '222.2 84% 4.9%',
    card: '0 0% 100%',
    cardForeground: '222.2 84% 4.9%',
    popover: '0 0% 100%',
    popoverForeground: '222.2 84% 4.9%',
    primary: '142.1 76.2% 36.3%', // Green
    primaryForeground: '355.7 100% 97.3%',
    secondary: '240 4.8% 95.9%', // Light Gray
    secondaryForeground: '240 5.9% 10%',
    muted: '240 4.8% 95.9%',
    mutedForeground: '240 3.8% 46.1%',
    accent: '240 4.8% 95.9%',
    accentForeground: '240 5.9% 10%',
    destructive: '0 84.2% 60.2%',
    destructiveForeground: '0 0% 98%',
    border: '240 5.9% 90%',
    input: '240 5.9% 90%',
    ring: '142.1 76.2% 36.3%',
  },
  radius: '0.75rem',
};

export const themes = {
  avp: avpTheme,
  unigrande: unigrandeTheme,
};

export type ThemeName = keyof typeof themes;
