# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/4PTI/sequence/4PTI.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/4PTI/seeds/seed_0/4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 1.278 A
- tm_score_ca_ordered: 0.8479595302262884
- heavy_atom_rmsd: 3.242 A
- sidechain_heavy_atom_rmsd: 4.331 A
- **all-atom quality (honest):** heavy 3.242 A, sidechain 4.331 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 286
- bin_accuracy: 0.776

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=42
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=5.565357539914054 -> 4.831133475278595 A
- topology_reconvergence: applied=True accepted=12/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.2776147188442744
- ga_delta_rmsd: 1.4362489149213125  ga_fitness_mode: energy
- pre_local_rmsd: 1.2901788745371217  localized_anchor_rmsd: 1.2775733946967744

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=18 · 3-10(G)=10 · coil(C)=7

```
EEHHGHHCEEEHEHHGECECGCGCHEGEEGHGHEHHEHHGCEGGCEHHEHHEHHHE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=6 · sheet=20
  - F3 ↔ P7  (helix)
  - T31 ↔ G35  (helix)
  - G35 ↔ A39  (helix)
  - A47 ↔ M51  (helix)
  - C50 ↔ C54  (helix)
  - M51 ↔ G55  (helix)
  - Y9 ↔ R19  (sheet)
  - T10 ↔ I17  (sheet)
  - T10 ↔ R19  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ R19  (sheet)
  - I17 ↔ Y34  (sheet)
  - I17 ↔ C37  (sheet)
  - R19 ↔ C29  (sheet)
  - R19 ↔ Y34  (sheet)
  - R19 ↔ C37  (sheet)
  - L28 ↔ N42  (sheet)
  - L28 ↔ S46  (sheet)
  - C29 ↔ N42  (sheet)
  - C29 ↔ S46  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=234 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=136 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7123 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
