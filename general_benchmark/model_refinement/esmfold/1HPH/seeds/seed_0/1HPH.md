# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1HPH\seeds\seed_0\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.390 A
- tm_score_ca_ordered: 0.20202333141239795
- heavy_atom_rmsd: 6.968 A
- sidechain_heavy_atom_rmsd: 7.925 A
- **all-atom quality (honest):** heavy 6.968 A, sidechain 7.925 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 518
- bin_accuracy: 0.724

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.390241221444392
- ga_delta_rmsd: -0.1953884322440702  ga_fitness_mode: energy
- pre_local_rmsd: 5.390247057053818  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.029), conflicts/hub=1.0, max_incompat=1.53Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R24** — severity 0.53, 1 conflict(s); suspect input ~`H13` (group: pull_in)
  - pull-in (wants closer): H13@16.3Å(now 18.9,conf 0.35)
  - Q28↔H13: targets 6.4/16.3Å but partners are 24.2Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=13 · 3-10(G)=3 · coil(C)=2

```
CEEHEHEHEHHEHEHEHEGHHGEHHEGEHHHEHHC
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=9 · sheet=12
  - I4 ↔ H8  (helix)
  - L6 ↔ L10  (helix)
  - G11 ↔ N15  (helix)
  - H13 ↔ M17  (helix)
  - M17 ↔ E21  (helix)
  - V20 ↔ R24  (helix)
  - E21 ↔ K25  (helix)
  - K25 ↔ D29  (helix)
  - D29 ↔ F33  (helix)
  - S2 ↔ M7  (sheet)
  - S2 ↔ N9  (sheet)
  - E3 ↔ N9  (sheet)
  - Q5 ↔ K12  (sheet)
  - M7 ↔ K12  (sheet)
  - M7 ↔ L14  (sheet)
  - N9 ↔ L14  (sheet)
  - N9 ↔ S16  (sheet)
  - K12 ↔ E18  (sheet)
  - E18 ↔ L23  (sheet)
  - L23 ↔ Q28  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=97 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7783 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
