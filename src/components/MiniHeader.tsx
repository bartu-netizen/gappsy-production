import { useState } from 'react';
import { Link } from 'react-router-dom';
import { Menu, X, ArrowRight } from 'lucide-react';

export default function MiniHeader() {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <div id="main-header" className="flex flex-col items-center mt-0 mb-2 md:mb-6">
      <button
        id="center-menu"
        onClick={() => setIsMenuOpen(!isMenuOpen)}
        className="inline-flex items-center rounded-full border-none cursor-pointer hover:shadow-lg transition-shadow bg-[#0A1735] text-white gap-3 px-6 md:gap-4 md:px-8"
        style={{
          height: '48px',
          boxShadow: '0 6px 18px rgba(0,0,0,0.08)'
        }}
      >
        <Link to="/" className="flex items-center">
          <img
            src="/logos/Gappsy-logo-white.webp"
            alt="Gappsy"
            className="h-5 md:h-[30px] w-auto"
          />
        </Link>
        <div className="w-7 h-7 md:w-8 md:h-8 rounded-full bg-white text-[#0A1735] flex items-center justify-center">
          {isMenuOpen ? <X className="w-3.5 h-3.5 md:w-4 md:h-4" strokeWidth={2.5} /> : <Menu className="w-3.5 h-3.5 md:w-4 md:h-4" strokeWidth={2.5} />}
        </div>
      </button>

      {isMenuOpen && (
        <div className="mt-4 bg-[#0A1735] text-white rounded-3xl p-8 max-w-[960px] w-full shadow-2xl animate-slideDown">
          <div className="flex flex-col md:flex-row md:items-start md:justify-between gap-8">
            <div>
              <h3 className="text-sm font-semibold text-gray-400 uppercase tracking-wide mb-4">Products</h3>
              <ul className="space-y-3">
                <li>
                  <Link
                    to="/appbuilder"
                    className="text-white hover:text-[#E8ECFA] transition-colors text-base flex items-center gap-2 group"
                    onClick={() => setIsMenuOpen(false)}
                  >
                    <span>Gappsy Appbuilder</span>
                    <ArrowRight className="w-4 h-4 opacity-0 group-hover:opacity-100 transition-opacity" />
                  </Link>
                </li>
                <li>
                  <Link
                    to="/proof"
                    className="text-white hover:text-[#E8ECFA] transition-colors text-base flex items-center gap-2 group"
                    onClick={() => setIsMenuOpen(false)}
                  >
                    <span>Gappsy Proof</span>
                    <ArrowRight className="w-4 h-4 opacity-0 group-hover:opacity-100 transition-opacity" />
                  </Link>
                </li>
                <li>
                  <Link
                    to="/analytics"
                    className="text-white hover:text-[#E8ECFA] transition-colors text-base flex items-center gap-2 group"
                    onClick={() => setIsMenuOpen(false)}
                  >
                    <span>Gappsy Analytics</span>
                    <ArrowRight className="w-4 h-4 opacity-0 group-hover:opacity-100 transition-opacity" />
                  </Link>
                </li>
              </ul>
            </div>

            <Link
              to="/login/apps"
              className="bg-white text-[#0A1735] px-8 py-3 rounded-xl font-semibold hover:bg-gray-100 transition-colors text-center inline-block self-start md:self-auto"
              onClick={() => setIsMenuOpen(false)}
            >
              Login
            </Link>
          </div>
        </div>
      )}
    </div>
  );
}
