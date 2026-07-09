import { createContext, useContext, useState, ReactNode } from 'react';

interface EditedListingData {
  intro: string;
  services: string[];
  contactEmail?: string;
  websiteUrl?: string;
}

interface OwnerListingEditContextType {
  editedData: EditedListingData | null;
  setEditedData: (data: EditedListingData | null) => void;
}

const OwnerListingEditContext = createContext<OwnerListingEditContextType | undefined>(undefined);

export function OwnerListingEditProvider({ children }: { children: ReactNode }) {
  const [editedData, setEditedData] = useState<EditedListingData | null>(null);

  return (
    <OwnerListingEditContext.Provider value={{ editedData, setEditedData }}>
      {children}
    </OwnerListingEditContext.Provider>
  );
}

export function useOwnerListingEdit() {
  const context = useContext(OwnerListingEditContext);
  if (context === undefined) {
    throw new Error('useOwnerListingEdit must be used within OwnerListingEditProvider');
  }
  return context;
}
