export default function TrustPill() {
  return (
    <div className="inline-flex items-center gap-2 px-3 py-1.5 bg-white border border-gray-200 rounded-full shadow-sm max-w-fit">
      <div className="flex items-center">
        <img
          src="/avatars/photo-1633332755192-727a05c4013d.jpeg"
          alt="Business owner"
          className="w-5 h-5 rounded-full object-cover border-2 border-white"
          style={{ zIndex: 3 }}
        />
        <img
          src="/avatars/photo-1535713875002-d1d0cf377fde.jpeg"
          alt="Business owner"
          className="w-5 h-5 rounded-full object-cover border-2 border-white -ml-1.5"
          style={{ zIndex: 2 }}
        />
        <img
          src="/avatars/photo-1438761681033-6461ffad8d80_(1).jpeg"
          alt="Business owner"
          className="w-5 h-5 rounded-full object-cover border-2 border-white -ml-1.5"
          style={{ zIndex: 1 }}
        />
      </div>
      <span className="text-[11.5px] sm:text-xs font-medium text-gray-700 whitespace-nowrap">
        Trusted by 10,000+ business owners
      </span>
    </div>
  );
}
