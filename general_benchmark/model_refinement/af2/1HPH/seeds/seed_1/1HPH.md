# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1HPH\seeds\seed_1\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.189 A
- tm_score_ca_ordered: 0.20596036621333416
- heavy_atom_rmsd: 7.024 A
- sidechain_heavy_atom_rmsd: 8.171 A
- **all-atom quality (honest):** heavy 7.024 A, sidechain 8.171 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 521
- bin_accuracy: 0.716

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain_block reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=14 rmsd=6.294888047474005 -> 3.854186573781186 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.189570532781296
- ga_delta_rmsd: -2.622030328545039  ga_fitness_mode: energy
- pre_local_rmsd: 5.189468453138899  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=10 · 3-10(G)=2 · coil(C)=3

```
CEEHEHEHHEHHCHGGHHEHEHHHHHHHEEHHEHC
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=10 · sheet=3
  - I4 ↔ H8  (helix)
  - H8 ↔ K12  (helix)
  - L14 ↔ E18  (helix)
  - E18 ↔ W22  (helix)
  - V20 ↔ R24  (helix)
  - W22 ↔ K26  (helix)
  - L23 ↔ L27  (helix)
  - R24 ↔ Q28  (helix)
  - L27 ↔ H31  (helix)
  - Q28 ↔ N32  (helix)
  - S2 ↔ M7  (sheet)
  - E3 ↔ L10  (sheet)
  - Q5 ↔ L10  (sheet)

## Solvent Accessibility (burial)

- buried=18 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=98 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7748 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
