import React, { useState, useEffect } from 'react';
import { User, FileText, Settings, MapPin, DollarSign, Star } from 'lucide-react';

interface SpotlightFormData {
  agencyName: string;
  contactPerson: string;
  email: string;
  websiteUrl: string;
  description: string;
  services: string[];
  budgetRange: string;
  state: string;
}

interface SpotlightAnimationProps {
  formData: SpotlightFormData;
  onComplete: () => void;
}

interface AnimationStep {
  icon: React.ReactNode;
  text: string;
  duration: number;
}

export default function SpotlightAnimation({
  formData,
  onComplete
}: SpotlightAnimationProps) {
  const [animationStep, setAnimationStep] = useState(0);

  const firstName = formData.contactPerson?.split(" ")[0] || "";
  const step1Text = firstName
    ? `Thanks ${firstName} — we're verifying your submission details…`
    : "We're verifying your submission details…";

  const servicesJoined = formData.services.slice(0, 3).join(', ');
  const locationText = formData.state;

  const steps: AnimationStep[] = [
    {
      icon: <User className="w-6 h-6" />,
      text: step1Text,
      duration: 1800
    },
    {
      icon: <FileText className="w-6 h-6" />,
      text: `Preparing your Spotlight application for ${formData.agencyName}…`,
      duration: 2000
    },
    {
      icon: <Settings className="w-6 h-6" />,
      text: `Reviewing your selected services — ${servicesJoined}…`,
      duration: 2200
    },
    {
      icon: <MapPin className="w-6 h-6" />,
      text: `Confirming Spotlight availability for ${locationText}…`,
      duration: 2000
    },
    {
      icon: <DollarSign className="w-6 h-6" />,
      text: `Verifying your starting price of ${formData.budgetRange}…`,
      duration: 1800
    },
    {
      icon: <Star className="w-6 h-6" />,
      text: `Finalizing your Spotlight listing preview…`,
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
