# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_7\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 1.931 A
- tm_score_ca_ordered: 0.7403021594287215
- heavy_atom_rmsd: 4.083 A
- sidechain_heavy_atom_rmsd: 5.168 A
- **all-atom quality (honest):** heavy 4.083 A, sidechain 5.168 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 439
- bin_accuracy: 0.790

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.9307036060095573
- ga_delta_rmsd: 3.166732381486059  ga_fitness_mode: energy
- pre_local_rmsd: 1.9380318250354216  localized_anchor_rmsd: 1.9307112335927314

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.019), conflicts/hub=1.0, max_incompat=1.9Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S7** — severity 1.08, 1 conflict(s); suspect input ~`R50` (group: push_out)
  - push-out (wants farther): R50@19.5Å(now 16.8,conf 0.57)
  - L10↔R50: targets 5.0/19.5Å but partners are 12.6Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=14 · 3-10(G)=8 · coil(C)=4

```
EEEGEHHHHGHHHHHHEHEGGECECHEHEHGHCEHGEHHHHGGHHHEHHHCE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=12 · sheet=11
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - A11 ↔ R15  (helix)
  - R12 ↔ E16  (helix)
  - K14 ↔ N18  (helix)
  - R26 ↔ Q30  (helix)
  - R28 ↔ S32  (helix)
  - L35 ↔ E39  (helix)
  - A40 ↔ I44  (helix)
  - Q41 ↔ W45  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - F17 ↔ Y22  (sheet)
  - F17 ↔ T24  (sheet)
  - F17 ↔ R27  (sheet)
  - F17 ↔ Q29  (sheet)
  - Y22 ↔ R27  (sheet)
  - Y22 ↔ Q29  (sheet)
  - T24 ↔ Q29  (sheet)
  - R27 ↔ E34  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=157 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=24 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6259 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
