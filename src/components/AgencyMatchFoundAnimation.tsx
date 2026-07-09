import { CheckCircle } from 'lucide-react';

interface AgencyMatchFoundAnimationProps {
  stateName: string;
}

export default function AgencyMatchFoundAnimation({ stateName }: AgencyMatchFoundAnimationProps) {
  return (
    <div className="flex flex-col items-center justify-center py-12 px-4">
      <div className="relative flex items-center justify-center w-20 h-20 mb-6">
        <div className="absolute inset-0 bg-green-100 rounded-full animate-ping"></div>
        <div className="relative flex items-center justify-center w-20 h-20 bg-green-100 rounded-full">
          <CheckCircle className="w-10 h-10 text-green-600" />
        </div>
      </div>

      <p className="text-base md:text-lg font-semibold text-gray-900 text-center leading-snug max-w-md">
        We recognized your agency in the {stateName} directory…
      </p>
    </div>
  );
}
