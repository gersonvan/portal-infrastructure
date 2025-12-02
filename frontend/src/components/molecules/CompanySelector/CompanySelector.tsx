'use client';

import React from 'react';
import { useTheme } from '@/contexts/ThemeContext';
import { ThemeName } from '@/styles/themes';

interface Company {
  id: string;
  name: string;
  theme: ThemeName;
}

const companies: Company[] = [
  { id: 'avp', name: 'AVP', theme: 'avp' },
  { id: 'unigrande', name: 'Unigrande', theme: 'unigrande' },
];

export function CompanySelector() {
  const { theme, setTheme } = useTheme();

  const handleChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    const selectedCompanyId = event.target.value;
    const selectedCompany = companies.find((c) => c.id === selectedCompanyId);
    
    if (selectedCompany) {
      setTheme(selectedCompany.theme);
    }
  };

  // Find the company that matches the current theme to set the select value
  const currentCompany = companies.find(c => c.theme === theme) || companies[0];

  return (
    <div className="flex flex-col gap-1.5">
      <label htmlFor="company-selector" className="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">
        Select Company
      </label>
      <select
        id="company-selector"
        value={currentCompany.id}
        onChange={handleChange}
        className="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50"
      >
        {companies.map((company) => (
          <option key={company.id} value={company.id}>
            {company.name}
          </option>
        ))}
      </select>
    </div>
  );
}
