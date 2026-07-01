# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_0\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 1.221 A
- tm_score_ca_ordered: 0.929652712208607
- heavy_atom_rmsd: 3.134 A
- sidechain_heavy_atom_rmsd: 3.934 A
- **all-atom quality (honest):** heavy 3.134 A, sidechain 3.934 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.014
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 798
- bin_accuracy: 0.857

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.2211524700847256
- ga_delta_rmsd: 6.769091766974938  ga_fitness_mode: energy
- pre_local_rmsd: 1.2250835599646572  localized_anchor_rmsd: 1.2211971971448008

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G74 → 11 conflicts (100%)
- explained: 11/11 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.027), conflicts/hub=5.5, max_incompat=4.1Å, chain_span=0.108
- **fix-first:** [LOW_CONFLICT] Root cause(s): G74 — explain ~11/11 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 14.35, 7 conflict(s); suspect input ~`L66` (group: push_out)
  - pull-in (wants closer): Q1@27.5Å(now 30.1,conf 1.00), K62@27.5Å(now 30.1,conf 1.00), P18@27.5Å(now 30.3,conf 1.00)
  - push-out (wants farther): L66@24.3Å(now 20.0,conf 0.72), R41@15.8Å(now 11.9,conf 0.55)
  - L68↔L66: targets 13.4/24.3Å but partners are 6.7Å apart → too_close_together by 4.1Å
  - H67↔L66: targets 17.0/24.3Å but partners are 3.9Å apart → too_close_together by 3.4Å
  - V69↔L66: targets 11.0/24.3Å but partners are 10.1Å apart → too_close_together by 3.2Å
- **L66** — severity 6.91, 4 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@24.3Å(now 20.0,conf 0.72)
  - V69↔G74: targets 10.9/24.3Å but partners are 10.1Å apart → too_close_together by 3.3Å
  - L70↔G74: targets 13.1/24.3Å but partners are 8.5Å apart → too_close_together by 2.7Å
  - G74↔R41: targets 24.3/9.9Å but partners are 11.9Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=29 · 3-10(G)=19 · coil(C)=4

```
EEEGGEGHCEEGGGGEGHHEEGHHHHHHHHHGEGECHEHEEECEHHEGEEGHEEHGHEHHEEHEEGGGGCEGEE
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=7 · sheet=41
  - S19 ↔ E23  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - L55 ↔ N59  (helix)
  - N59 ↔ E63  (helix)
  - Q1 ↔ T11  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ D20  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ D20  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ T11  (sheet)
  - F3 ↔ V16  (sheet)
  - T6 ↔ T11  (sheet)
  - V16 ↔ T21  (sheet)
  - E33 ↔ Q40  (sheet)
  - I35 ↔ Q40  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=36 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=248 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=113 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4823 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0135

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
