import React, { useState, useEffect } from 'react';
import { Search, Sparkles, MapPin, Star } from 'lucide-react';

interface SubmittedAgency {
  agencyName: string;
  contactPerson: string;
  email: string;
  websiteUrl: string;
  description: string;
  services: string[];
  budgetRange?: string;
  state: string;
}

interface SubmitAgencyAnimationProps {
  submittedAgency: SubmittedAgency;
  onComplete: () => void;
}

interface AnimationStep {
  icon: React.ReactNode;
  text: string;
  duration: number;
}

export default function SubmitAgencyAnimation({
  submittedAgency,
  onComplete
}: SubmitAgencyAnimationProps) {
  const [animationStep, setAnimationStep] = useState(0);

  const firstName = submittedAgency.contactPerson?.split(" ")[0] || "";
  const step1Text = firstName
    ? `Thanks ${firstName}, we're preparing your submission…`
    : "We're preparing your submission…";

  const steps: AnimationStep[] = [
    {
      icon: <Search className="w-6 h-6" />,
      text: step1Text,
      duration: 1800
    },
    {
      icon: <Sparkles className="w-6 h-6" />,
      text: `Reviewing the details you submitted for ${submittedAgency.agencyName}…`,
      duration: 2000
    },
    {
      icon: <MapPin className="w-6 h-6" />,
      text: `Finding available Top 25 spots in ${submittedAgency.state}…`,
      duration: 2200
    },
    {
      icon: <Star className="w-6 h-6" />,
      text: `Good news — a Top 25 placement option is available.`,
      duration: 1700
    }
  ];

  useEffect(() => {
    if (animationStep < steps.length - 1) {
      const timer = setTimeout(() => {
        setAnimationStep(prev => prev + 1);
      }, steps[animationStep].duration);

      return () => clearTimeout(timer);
    } else {
      const finalTimer = setTimeout(() => {
        onComplete();
      }, steps[animationStep].duration);

      return () => clearTimeout(finalTimer);
    }
  }, [animationStep, steps]);

  return (
    <div className="p-8 min-h-[450px] flex flex-col items-center justify-center">
      <div className="w-20 h-20 mb-8 relative">
        <div className="absolute inset-0 border-4 border-blue-100 rounded-full"></div>
        <div className="absolute inset-0 border-4 border-[#0A1735] border-t-transparent rounded-full animate-spin"></div>
      </div>

      <div className="text-center transition-all duration-500 ease-in-out">
        <div className="flex items-center justify-center gap-3 mb-3 text-[#0A1735]">
          {steps[animationStep].icon}
        </div>
        <p className="text-gray-800 text-lg font-medium max-w-md leading-relaxed">
          {steps[animationStep].text}
        </p>
      </div>
    </div>
  );
}
