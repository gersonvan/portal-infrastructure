import type { Meta, StoryObj } from '@storybook/react';
import { CompanySelector } from './CompanySelector';
import { ThemeProvider } from '@/contexts/ThemeContext';

const meta = {
  title: 'Molecules/CompanySelector',
  component: CompanySelector,
  parameters: {
    layout: 'centered',
  },
  tags: ['autodocs'],
  decorators: [
    (Story) => (
      <ThemeProvider>
        <div className="w-[300px] p-4 border rounded-lg bg-card text-card-foreground">
          <Story />
        </div>
      </ThemeProvider>
    ),
  ],
} satisfies Meta<typeof CompanySelector>;

export default meta;
type Story = StoryObj<typeof meta>;

export const Default: Story = {};
