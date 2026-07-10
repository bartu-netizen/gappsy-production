import { Link } from 'react-router-dom';
import { ChevronRight } from 'lucide-react';

export interface ToolBreadcrumbItem {
  name: string;
  path?: string;
}

// Visual breadcrumb trail. Mirrors the BreadcrumbList JSON-LD that
// EntitySEOTags already generates from the same `name`/`path` shape, so the
// visible nav and the structured data never drift apart.
export default function ToolBreadcrumbs({ items }: { items: ToolBreadcrumbItem[] }) {
  const trail: ToolBreadcrumbItem[] = [{ name: 'Home', path: '/' }, ...items];

  return (
    <nav aria-label="Breadcrumb" className="mb-5">
      <ol className="flex items-center gap-1.5 text-xs text-slate-400 flex-wrap">
        {trail.map((item, index) => {
          const isLast = index === trail.length - 1;
          return (
            <li key={`${item.name}-${index}`} className="flex items-center gap-1.5">
              {index > 0 && <ChevronRight className="w-3 h-3 shrink-0" />}
              {isLast || !item.path ? (
                <span className={isLast ? 'text-slate-500 font-medium' : ''} aria-current={isLast ? 'page' : undefined}>
                  {item.name}
                </span>
              ) : (
                <Link to={item.path} className="hover:text-slate-600 transition-colors">
                  {item.name}
                </Link>
              )}
            </li>
          );
        })}
      </ol>
    </nav>
  );
}
