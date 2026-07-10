import { Plug } from 'lucide-react';
import type { IntegrationItem } from './types';
import ToolsSectionHeader from '../ToolsSectionHeader';
import Card from './Card';

export default function IntegrationsSection({ toolName, integrations }: { toolName: string; integrations: IntegrationItem[] }) {
  if (integrations.length === 0) return null;

  return (
    <section id="integrations" className="scroll-mt-24">
      <ToolsSectionHeader eyebrow="Integrations" title={`${toolName} integrations`} />
      <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-3">
        {integrations.map((integration) => (
          <Card key={integration.id} hoverLift className="p-4 flex items-center gap-3">
            {integration.integration_logo ? (
              <img src={integration.integration_logo} alt={integration.integration_name} className="w-9 h-9 rounded-lg object-contain border border-slate-100 shrink-0" />
            ) : (
              <div className="w-9 h-9 rounded-lg bg-slate-100 flex items-center justify-center text-slate-400 shrink-0">
                <Plug className="w-4 h-4" />
              </div>
            )}
            <div className="min-w-0">
              <p className="font-medium text-[#0B1221] text-[13.5px] truncate">{integration.integration_name}</p>
              {integration.description && <p className="text-[12px] text-slate-500 truncate">{integration.description}</p>}
            </div>
          </Card>
        ))}
      </div>
    </section>
  );
}
